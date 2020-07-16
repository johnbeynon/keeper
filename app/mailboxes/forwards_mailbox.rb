class ForwardsMailbox < ApplicationMailbox
  def process
    logger.info("Processing email from #{mail.from}")
    if permitted_sender?
      Receipt.create(
        transaction_date: Date.today, 
        tray: creator.tray.first, 
        creator: creator,
        images: attachments.map{ |a| a[:blob] }
      )
    else
      logger.info("Rejected email from #{mail.from}")
      raise mail.from.inspect
    end
  end

  private

  def permitted_sender?
    (User::PERMITTED_USERS.concat User::PERMITTED_SENDERS).include? mail.from
  end

  def attachments
    @_attachments = mail.attachments.map do |attachment|
      blob = ActiveStorage::Blob.create_after_upload!(
        io: StringIO.new(attachment.body.to_s),
        filename: attachment.filename,
        content_type: attachment.content_type,
      )
      { original: attachment, blob: blob }
    end
  end

  def creator
    @forwarder || User.first
  end

  def forwarder
    @forwarder ||= User.find_by(email: mail.from)
  end
end
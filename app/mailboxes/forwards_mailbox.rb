class ForwardsMailbox < ApplicationMailbox
  def process
    Receipt.create(
      transaction_date: Date.today, 
      tray: Tray.first, 
      creator: User.first,
      images: attachments.map{ |a| a[:blob] }
    )
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
end

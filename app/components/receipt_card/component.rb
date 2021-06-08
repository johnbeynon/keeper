# frozen_string_literal: true

module ReceiptCard
  class Component < ApplicationComponent
    def initialize(receipt:)
      @receipt = receipt
    end
  end
end

# frozen_string_literal: true

module TrayCard
  class Component < ApplicationComponent
    def initialize(permission:)
      @permission = permission
    end
  end
end

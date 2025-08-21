# frozen_string_literal: true

require "ostruct"

# Standardizes what a service method should always return
module ServiceContract
  def self.success(payload)
    OpenStruct.new({ success?: true, payload:, errors: nil })
  end

  def self.error(errors)
    OpenStruct.new({ success?: false, payload: nil, errors: })
  end
end

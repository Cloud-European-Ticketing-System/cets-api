module CETS
  class DeviceRepo
    class << self
      def id_by_token(token)
        Device.where(token: token).pluck(:id).first
      end

      def create(type, token, user_id)
        Device.create({
          device_type: type,
          token:       token,
          user_id:     user_id
        })
      end
    end
  end
end

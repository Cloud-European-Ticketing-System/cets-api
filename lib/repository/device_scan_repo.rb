module CETS
  class DeviceScansRepo
    class << self
      def create(device_id)
        DeviceScan.create(device_id: device_id)
      end
    end
  end
end

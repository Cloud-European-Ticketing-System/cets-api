module CETS
  class CompaniesRepo
    class << self
      def all(limit = 20, offset = 0)
        Company.limit(limit).offset(offset).all.map(&:as_hash)
      end
    end
  end
end

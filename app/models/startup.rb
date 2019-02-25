class Startup
attr_accessor :domain, :name
attr_reader :founder

 @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(domain, name)
    self.domain = domain
    self.name = name
  end

  def self.find_by_founder(founder)
    self.all.find do |startup|
      startup.founder == founder
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end.uniq
  end

  def sign_contract(venture_capitalist, investment_type, amount)
    FundingRound.new(self, venture_capitalist, investment_type, amount)
    # initialize(startup, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    FundingRound.all.select do |round|
      round.startup == self
    end.length
  end

  def total_funds
    FundingRound.all.select do |round|
      round.startup == self
    end.map do |round|
      round.investment
    end.inject(0) {|sum, n| sum + n}
  end

  def investors
    FundingRound.all.select do |round|
      round.startup == self
    end.map do |round|
      round.venture_capitalist
    end.uniq
  end

  def big_investors
    self.investors.select do |investor|
      investor.class.tres_commas_club.include?(investor)
    end
  end

end

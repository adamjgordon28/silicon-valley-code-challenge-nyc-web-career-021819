class VentureCapitalist

  @@all = []

  attr_accessor :name, :total_worth

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select do |capitalist|
      capitalist.total_worth > 1000000000
    end
  end

  def offer_contract(startup,investment_type,amount)
    FundingRound.new(startup,self,investment_type,amount)
    #initialize(startup, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
  end

  def portfolio
    self.funding_rounds.map do |round|
      round.startup
    end.uniq
  end


  def biggest_investment
      biggest_investment = 0
      self.funding_rounds.each do |round|
        if round.investment > biggest_investment
        then biggest_investment = round.investment
         end
       end
      self.funding_rounds.select do |round|
      round.investment == biggest_investment
      end
  end


  def invested(domain)
    self.funding_rounds.select do |round|
      round.startup.domain == domain
    end.map do |round|
      round.investment
    end.inject(0){|sum,n| sum+n}
  end

end

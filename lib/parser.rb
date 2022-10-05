class Parser
  def initialize(file:)
    @file = file
    @views = []
  end

  attr_reader :views

  def parse_log_file
    lines = File.readlines @file
    lines.each do |line|
      @views << line
    end
  end
end
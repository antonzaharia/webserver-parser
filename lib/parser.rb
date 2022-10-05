class Parser
  def initialize(file:)
    @file = file
    @views = []
  end

  attr_reader :views

  def parse_log_file
    lines = File.readlines @file
    lines.each do |line|
      (path, ip) = line.split()
      page = @views.find { |view| view[:path] == path }
      if page
        if page[:ips].include?(ip)
        else
          page[:ips] << ip
          page[:count] += 1
        end
      else
        @views << { path:, ips: [ip], count: 1 }
      end
    end
  end
end
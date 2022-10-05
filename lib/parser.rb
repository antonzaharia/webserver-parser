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
          puts "IP #{ip} revisited #{path}"
        else
          puts "New unique visit for page #{path}"
          page[:ips] << ip
          page[:count] += 1
        end
      else
        puts "New visit #{path}"
        @views << { path:, ips: [ip], count: 1 }
      end
    end
  end

  def order_views
    @views.sort_by { |view| -view[:count] }
  end

  def humanize_view(view)
    "#{view[:path]} #{view[:count]} unique views"
  end

  def read_views
    order_views.each do |view|
      puts humanize_view(view)
    end
  end
end

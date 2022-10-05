require './lib/parser.rb'

describe 'Parser' do
  describe '.parse_log_file' do
    let(:test1) { './spec/test1.log' }
    let(:test2) { './spec/test2.log' }
    let(:test3) { './spec/test3.log' }
    let(:test4) { './spec/test4.log' }

    it 'should be able to add new view' do
      parser = Parser.new(file: test1)
      parser.parse_log_file

      expect(parser.views.size).to eq(1)
    end
    it 'should be able to add views to different pages' do
      parser = Parser.new(file: test2)
      parser.parse_log_file

      expect(parser.views.size).to eq(2)
    end
    it 'should be able to increase the count on the same views' do
      parser = Parser.new(file: test3)
      parser.parse_log_file

      expect(parser.views.first[:count]).to eq(2)
    end
    it 'should not count duplicated views' do
      parser = Parser.new(file: test4)
      parser.parse_log_file

      expect(parser.views.first[:count]).to eq(1)
    end
  end
  describe '.read_views' do
    let(:test5) { './spec/test5.log' }

    it 'print the views in the right format' do
      parser = Parser.new(file: test5)
      parser.parse_log_file

      expect(parser.humanize_view(parser.views.first)).to eq('/home 2 unique views')
      expect(parser.humanize_view(parser.views[1])).to eq('/contact 3 unique views')
    end
  end
end

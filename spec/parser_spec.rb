require './lib/parser.rb'

describe 'Parser' do
  describe '.parse_log_file' do
    let(:test1) { 'test1.log' }
    let(:test2) { 'test2.log' }
    let(:test3) { 'test3.log' }
    let(:test4) { 'test4.log' }

    it 'should be able to add new view' do
      parser = Parser.new(test1)
      parser.parse_log_file

      expect(parser.views.size).to eq(1)
    end
    it 'should be able to add views to different pages' do
      parser = Parser.new(test2)
      parser.parse_log_file

      expect(parser.views.size).to eq(2)
    end
    it 'should be able to increase the count on the same views' do
      parser = Parser.new(test3)
      parser.parse_log_file

      expect(parser.views.first[:count]).to eq(2)
    end
    it 'should not count duplicated views' do
      parser = Parser.new(test4)
      parser.parse_log_file

      expect(parser.views.first[:count]).to eq(2)
    end
  end
  describe '.read_views' do
    it 'print the views in the right format' do
      expect(false).to eq(true)
    end
  end
end
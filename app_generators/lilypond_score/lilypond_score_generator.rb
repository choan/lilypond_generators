class LilypondScoreGenerator < RubiGen::Base
  
  attr_accessor :score_dirname
  attr_accessor :score_title
  attr_accessor :instruments
  attr_accessor :composer
  attr_accessor :movements
  attr_accessor :version_str
  
  def initialize(runtime_args, runtime_options = {})
    self.instruments = []
    self.movements = 1
    super
    usage if args.empty?
    @destination_root = args.shift
    self.score_dirname = File.basename(File.expand_path(@destination_root))
    self.score_title = score_dirname.camelize
  end

  def manifest
    
    self.instruments = ['instrument'] if self.instruments.empty?
    
    record do |m|
            
      m.directory ''
      m.template 'header.lyi', 'header.lyi'
      m.template 'defs.lyi', 'defs.lyi'
      m.template 'part.lyi', 'part.lyi'
      
      instruments.each do |instrument|
        m.template 'instrument.ly', "#{instrument}.ly", :assigns => { :instrument => instrument }
        m.template 'instrument.lyi', "#{instrument}.lyi", :assigns => { :instrument => instrument }
      end
      
      (0...movements).each do |movement|
        mvt = "Mvt" + roman(movement)
        m.template 'score_mvt.ly', "score_mvt_#{roman(movement).downcase }.ly", :assigns => { :mvt => mvt }
      end
      
    end
    
  end
  
  def roman n
    %w[I II III IV V VI][n]
  end
  
  def version_str
    '\version "2.12.2"'
  end
    
  protected
  
    def add_options!(opts)
      opts.on("-a", "--composer=COMPOSER", String) { |v| self.composer = v }
      opts.on("-i", "--instrument=INSTRUMENT", String) { |v| self.instruments.push(v) }
      opts.on("-m", "--movements=MOVEMENTS", Integer) { |v| self.movements = v }
    end
  
end
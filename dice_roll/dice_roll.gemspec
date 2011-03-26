# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dice_roll/version"

Gem::Specification.new do |s|
  s.name        = "dice_roll"
  s.version     = DiceRoll::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Stuart Hanscombe"]
  s.email       = ["hanscs1969@yahoo.co.uk"]
  s.homepage    = ""
  s.summary     = %q{Simple dice throwing code}
  s.description = %q{A library that throws some dice and gives you the result, you can choose the number of dice and the number of sides the dice have}

  s.rubyforge_project = "dice_roll"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

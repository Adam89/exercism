begin
  gem 'minitest', '~> 5.0'
  require 'minitest/autorun'
  require 'minitest/pride'

  require_relative 'dna'

  class DNATest < Minitest::Test

    def test_transcribes_cytidine_unchanged
      skip
      assert_equal 'C', DNA.new("C").to_rna
    end

    def test_transcribes_guanosine_unchanged
      assert_equal 'G', DNA.new("G").to_rna
    end

    def test_transcribes_adenosine_unchanged
      skip
      assert_equal 'A', DNA.new("A").to_rna
    end

    def test_it_transcribes_thymidine_to_uracil
      skip
      assert_equal 'U', DNA.new("T").to_rna
    end

    def test_it_transcribes_all_occurrences_of_thymidine_to_uracil
      skip
      assert_equal 'ACGUGGUCUUAA', DNA.new('ACGTGGTCTTAA').to_rna
    end

    module HandHolding

      class Explanation
        attr_reader :failure

        def initialize(failure)
          @failure = failure
        end

        def explain
          instructions.each do |instruction|
            spell_out instruction
          end
          6.times { puts }
        end

        def spell_out(instruction)
          7.times { puts }
          puts "Hit enter to continue..."
          gets
          7.times { puts }
          puts instruction
          puts
        end
      end

      class UninitializedConstantExplanation < Explanation
        def self.explains?(failure)
          failure.exception.message == 'uninitialized constant DNATest::DNA'
        end

        def instructions
          [
            "You got an error saying:\n\n\n\t#{failure.exception.message}",
            "#{failure.exception.message} means that your test suite, which is named DNATest, doesn't know about any constant DNA. You need to define it. I'll tell you how to do that next...",
            "Open up your empty dna.rb file, and write:\n\n\tclass DNA\n\tend"
          ]
        end
      end

      class OneForZeroExplanation < Explanation
        def self.explains?(failure)
          failure.exception.message =~ /wrong number of arguments/ && failure.exception.backtrace.first =~ /\`initialize'\z/
        end

        def instructions
          [
            "You got an error saying '#{failure.exception.message}'",
            "If you look closely at where it says the error is occurring, you'll see this:\n\n\t#{failure.exception.backtrace.first}\n\nSo where is this `initialize` method? Our DNA class is empty!",
            "Empty ruby classes are given a default initialize method which looks like this:\n\n\tdef initialize\n\tend\n\nSo it's there, even if we don't see it.",
            "The problem is that we need an initialize method that looks like this:\n\n\tdef initialize(something)\n\tend\n\ninstead of this:\n\n\tdef initialize\n\tend",
            "The solution is to open up your dna.rb file and change it to the following:\n\n\tclass DNA\n\t  def initialize(strand)\n\t  end\n\tend\n\n\n\n"
          ]
        end
      end

      class AssertionExplanation < Explanation
        def self.explains?(failure)
          failure.class === Minitest::Assertion
        end

        def instructions
          [
            "You got a failing test. That's great! It will tell you exactly what you need to do to fix it.",
            "Take a look at the message:\n\n\n#{failure.message}",
            "Change the return value of `to_rna` so that it returns the expected value.\n\nFor example, if an error says 'Expected: 5, Got: nil', then there's a chance that the method is empty. Change the method to return the expected value.",
            "Sometimes you have two tests that conflict. In those cases it's your job to implement the method so that it makes both tests pass. It's OK to do that in the simplest, ugliest way possible, and then when you understand the problem better, you can improve the code."
          ]
        end
      end

      class DefaultExplanation < Explanation
        def self.explains?(failure)
          true
        end

        def instructions
          [
            "Something blew up.",
            "When you ask for help, give us the following:\n\n#{failure.message}"
          ]
        end
      end

      class UndefinedMethodExplanation < Explanation
        def self.explains?(failure)
          failure.exception.message =~ /undefined method/
        end

        def method_name
          failure.exception.message.match(/`(.*)'/)[1]
        end

        def instructions
          [
            "This time you got a message saying '#{failure.exception.message}'",
            "The way to fix an 'undefined method' error is to take the method name it says is missing, in this case `#{method_name}`, and then define a method with that name.",
            "In other words, add the following method definition to your class:\n\n\tdef #{method_name}\n\tend\n\n\n\n"
          ]
        end
      end

      class SkipExplanation < Explanation
        def instructions
          [
            "Now you can go to the next test and delete the line that says `skip`"
          ]
        end
      end

      def ascii_error
        <<-ERROR

######## ########  ########   #######  ########  
##       ##     ## ##     ## ##     ## ##     ## 
##       ##     ## ##     ## ##     ## ##     ## 
######   ########  ########  ##     ## ########  
##       ##   ##   ##   ##   ##     ## ##   ##   
##       ##    ##  ##    ##  ##     ## ##    ##  
######## ##     ## ##     ##  #######  ##     ## 

        ERROR
      end

      def ascii_win
        <<-WIN

##      ## #### ##    ## 
##  ##  ##  ##  ###   ## 
##  ##  ##  ##  ####  ## 
##  ##  ##  ##  ## ## ## 
##  ##  ##  ##  ##  #### 
##  ##  ##  ##  ##   ### 
 ###  ###  #### ##    ## 

        WIN
      end

      def explanations
        [
          UninitializedConstantExplanation,
          OneForZeroExplanation,
          UndefinedMethodExplanation,
          DefaultExplanation
        ]
      end

      def after_teardown
        @@failure_count ||= 0
        @@skip_count ||= 0
        if error?
          @@failure_count += 1
          explanation = explanations.find {|e| e.explains?(failure)}
          Minitest.after_run do
            puts ascii_error
            explanation.new(failure).explain
          end
        elsif skipped?
          @@skip_count += 1
          @@reported_skips ||= 0
          Minitest.after_run do
            if @@failure_count == 0 && @@reported_skips == 0
              @@reported_skips += 1
              if @@skip_count == 4
                puts ascii_win
                SkipExplanation.new(failure).explain
              end
            end
          end
        elsif passed?
          # Eh. I don't think we'll do anything for this.
        else
          @@failure_count += 1
          Minitest.after_run do
            # AssertionExplanation.new(failure).explain
          end
        end
      end
    end

    include HandHolding

  end

rescue Gem::LoadError => e

  puts
  puts
  puts
  puts "You're going to need the `minitest` gem for this:"
  puts
  puts "Try this:"
  puts "gem install minitest"
  puts
  puts

rescue LoadError => e

  def explain(something)
    7.times { puts }
    puts "Hit enter to continue..."
    gets
    7.times { puts }
    puts something
    puts
  end

  zomg = <<-ERROR
######## ########  ########   #######  ########  
##       ##     ## ##     ## ##     ## ##     ## 
##       ##     ## ##     ## ##     ## ##     ## 
######   ########  ########  ##     ## ########  
##       ##   ##   ##   ##   ##     ## ##   ##   
##       ##    ##  ##    ##  ##     ## ##    ##  
######## ##     ## ##     ##  #######  ##     ## 

  ERROR
  puts
  puts zomg

  explain "I'm going to\n* show you an error message,\n* then explain what you're seeing\n* then tell you how to fix it."
  explain "Seriously, don't freak out. It's not that bad."
  explain "OK, this is it:\n\n#{e.backtrace.first} #{e.message}"
  explain "First it tells you the name of the file where the error is occurring.\n\n\n\trna-transcription_test.rb\n\n\nThat's this test file that you just ran."
  explain "Then it tells you which line that error is on.\n\n\n\trna-transcription_test.rb:5\n\n\nSo the error is on line 5 of rna-transcription_test.rb"

  explain "After that, it tells you the name of the method where the error is occurring.\n\n\n\tin `require_relative'\n\n\nIn other words, when the code says `require_relative` on line 5 of this test file, something blows up."
  explain "Next, it tells you exactly what the error is.\n\n\n\tcannot load such file\n\n\nIt's trying to load a file that doesn't exist."
  explain "Finally, it tells you which file is missing.\n\n\n\t/path/to/your/code/ruby/rna-transcription/dna\n\n\nLook at the bit after the last slash: That's the filename. We're in ruby, so it is looking for a file named dna.rb"
  explain "You can fix the problem by creating an empty file named dna.rb inside the same directory as the test file."
  explain "Now take another look at the error message.\n\nDoes it make more sense?\n\n\n#{e.backtrace.first} #{e.message}"
  explain "PS: If you know what you're doing, go ahead and delete the HandHolding module in this test suite."
  10.times { puts }
  exit!
end

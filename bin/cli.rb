require_relative '../config/environment.rb'

class CLI

    APPROVED_COMMANDS = [:list, :html, :help, :exit]


    def initialize
        initial = Parser.new('hello')
        initial.call
        @on = true
    end

    def call
        system("clear")
        puts
        puts "****************************************************************"
        puts "* ------------------------------------------------------------ *"
        puts "* Welcome to the Flatiron School student command line browser. *"
        puts "* ------------------------------------------------------------ *"
        puts "*                    presented by...                           *"
        puts "*                   Team TableStealers                         *"
        puts "****************************************************************"
        # system("say welcome to the flatiron school student command line browser")
        puts

        puts "                .--.                  Try not.
                    ::\\`--._,'.::.`._.--'/::     Do or do not.
                    ::::.  ` __::__ '  .::::    There is no try.
                    ::::::-:.`'..`'.:-::::::
                    ::::::::\\ `--' /::::::::              -Yoda"

        # system(" say try not. ")
        # system(" say do. or do not")
        # system(" say there is no try.")
        input = gets.chomp.downcase
        command(input)
    end

    def on?
        @on
    end

    def exit
        puts "Shutting down..."
        system("say goodbye")
        puts "Goodbye!"
        @on = false
    end

    def command(input)
        if APPROVED_COMMANDS.include?(input.strip.downcase.to_sym)
            self.send(input)
        elsif input.start_with?("show")
            show
        else
            puts "Invalid command! Try again"
            system ("say oops")
        end

    end
    
    def help
        puts
        puts "Here are 3 options you have, User. "
        puts " ------------------------------ "
        puts "  *  Type 'list' to list all of the songs in database"
        puts "  *  Type 'html' to generate the pages for each artist"
        puts "     name or album"
        puts "  *  Type exit to quit"
        input = gets.downcase.strip
        command(input)
    end

    def list
        Artist.all.each_with_index do |artist,idx|
            previous_artist = Artist.all[idx - 1]
            if idx.even?
                print "#{artist.name}"
            else
                print ' ' * (30 - previous_artist.name.length)
                puts "#{artist.name}".rjust(50)
            end
        end
        puts
        # system("say by the way you are super cool and everyone likes you")
    end

    def html

        # puts "Enter a name or ID number"
        # input = gets.strip.downcase
        # if input.to_i > 0
        #     output = Student.find(input.to_i)
        #     print_student_info(output)
        #     return
        # else
        #     output = Student.find_by_name(input)
        #     output.each do |thing|
        #         print_student_info(thing)
        #     end

        #     return
        # end
        #     puts "Oh no!"
        #     system("say mistakes")
    end



    # def print_student_info(student)
    #     puts "-------------------------------------------------"
    #     puts "Student name: #{student.name}"
    #     puts "Website link: #{student.website}"
    #     puts "Twitter page: #{student.twitter}"
    #     puts "LinkedIn page: #{student.linkedin}"
    #     puts "-------------------------------------------------"
    #     system("say #{student.name}")
    # end
    
end

a = CLI.new
a.call







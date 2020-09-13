class CLI 
   
    def run
        puts "Welcome to the Guild Wars 2 Account Dragon!"
        puts "Please insert your account API Key here:"
        input = gets.chomp
        puts "Thank you. Now to summon the dragon...!"
        API.scrape_account(input)
        dragon
    end

    def dragon
        puts "                 ___====-_  _-====___
           _--^^^#####//      \\\\#####^^^--_
        _-^##########// (    ) \\\\##########^-_
       -############//  |\\^^/|  \\\\############-
     _/############//   (@::@)   \\\\############\\_
    /#############((     \\\\//     ))#############\\
   -###############\\\\    (oo)    //###############-
  -#################\\\\  / VV \\  //#################-
 -###################\\\\/      \\//###################-
_#/|##########/\\######(   /\\   )######/\\##########|\\#_
|/ |#/\\#/\\#/\\/  \\#/\\##\\  |  |  /##/\\#/  \\/\\#/\\#/\\#| \\|
`  |/  V  V  `   V  \\#\\| |  | |/#/  V   '  V  V  \\|  '
   `   `  `      `   / | |  | | \\   '      '  '   '
                    (  | |  | |  )
                   __\\ | |  | | /__
                  (vvv(VVV)(VVV)vvv)"
        puts "WELCOME MORTAL. CHOOSE FROM A LIST OF OPTIONS BELOW."
        menu
    end

    def menu
        puts '1. "Show me my characters."'
        puts '2. "Show me my account."'
        puts '3. "Who are you?"'
        puts '4. "Who made this?"'
        puts '5. "I am just... gonna go, now."'
        input = gets.chomp

        case input
        when "1"
            puts '
"VERY WELL..."
                 '
            list_characters
        when "2"
            puts '
"VERY WELL..."
                 '
            show_accounts
        when "3"
            puts '
"I AM THE DRAGON THAT GUARDS INFORMATION. SOME DRAGONS HOARD GOLD, SOME DRAGONS HOARD CASTLES AND JEWELS, I HOARD INFORMATION."

"IT IS MY DUTY TO ENSURE THAT DATA IS KEPT SAFE AND SECURE. I ANSWER THE CALL OF MORTALS TO GIVE THEM DATA THAT IS RIGHTFULLY THEIRS."

"SO MAKE YOUR REQUESTS, MORTAL. I LIVE FOREVER, YOU DO NOT."
                 '
            menu
        when "4"
            puts '
"A CLEVER WIZARD CREATED THIS SPELL TO SUMMON ME SO THAT HE MIGHT BARGAIN FOR MY WEALTH OF KNOWLEDGE."

"UNFORTUNATELY, HE USED THIS SPELL WHILE I WAS QUITE HUNGRY AND MADE MANY UNREASONABLE DEMANDS. WIZARDS ARE CRUNCHY AND GO GREAT WITH KETCHUP."

"FORTUNATELY FOR YOU, HOWEVER, I AM NOT VERY HUNGRY RIGHT NOW."

"PRAY THAT DOES NOT CHANGE SOON."
                 '
            menu
        when "5"
            puts '
"FAREWELL, MORTAL."
                 '
            exit
        else 
            puts '
"DO NOT WASTE MY TIME, MORTAL. CHOOSE A VALID OPTION."
                 '
            menu
        end
    end

    def list_characters
            characters = Character.all
            characters.each.with_index do |char, index|
                puts "#{index + 1}. #{char.name}"
            end
            puts '
"CHOOSE A CHARACTER NUMBER FROM THIS LIST OR SAY MENU TO CHOOSE A DIFFERENT OPTION."
             '
            input = gets.chomp
            if (1..characters.length).include?(input.to_i)
                puts "
Name: #{characters[input.to_i - 1].name}
Gender: #{characters[input.to_i - 1].gender}
Race: #{characters[input.to_i - 1].race}
Class: #{characters[input.to_i - 1].profession}
Level: #{characters[input.to_i - 1].level}
                     "
                puts '
"DO YOU WANT TO SEE ANOTHER CHARACTER?"
                
Yes, No, or Menu?           '
                input = gets.chomp.downcase
                case input
                when "no"
                    menu
                when "yes"
                    list_characters
                else
                    puts '
"I HAVE NO IDEA WHAT YOU JUST SAID. HERE IS THE MENU, JUST IN CASE."
                         '
                    menu
                end
            elsif input == "menu"
                menu
            else
            puts '
"THIS IS NOT A VALID ANSWER, MORTAL. TRY AGAIN.
                 '
            list_characters
        end
    end

    def show_accounts
            accounts = Account.all
            accounts.each.with_index do |account, index|
                puts "#{index + 1}. #{account.global}"
            end
            guilds = []
            Guild.all.each do | guild |
                guilds << "#{guild.name}: #{guild.tag}"
            end
            puts '
"CHOOSE A NUMBER FROM THIS LIST OF GLOBALS OR SAY MENU TO CHOOSE A DIFFERENT OPTION."
                 '
            input = gets.chomp
            if (1..accounts.length).include?(input.to_i)
                puts "
Global: #{accounts[input.to_i - 1].global}
Age (In Hours!): #{accounts[input.to_i - 1].age / 3600}
Guilds (With Tags): #{guilds}
Available Content: #{accounts[input.to_i - 1].version}
                     "
                puts '
"DO YOU WANT TO SEE ANOTHER ACCOUNT?"
                
Yes, No, or Menu?           ' 
                input = gets.chomp.downcase
                case input
                when "no"
                    menu
                when "yes"
                    show_accounts
                else
                    puts '
"I HAVE NO IDEA WHAT YOU JUST SAID. HERE IS THE MENU, JUST IN CASE."
                         '
                    menu
                end
            elsif input == "menu"
                menu
            else
            puts '
"THIS IS NOT A VALID ANSWER, MORTAL. TRY AGAIN.
                 '
            show_accounts
            end
    end

end


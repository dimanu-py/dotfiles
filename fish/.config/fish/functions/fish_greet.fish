function fish_greeting
    # Get the current time and choose greeting based on the time of day
    set hour (date +"%H")
    if test $hour -lt 12
        set time_of_day "🌅 Good morning"
    else if test $hour -lt 18
        set time_of_day "🌞 Good afternoon"
    else
        set time_of_day "🌜 Good evening"
    end

    # Get random motivational quotes
    set quotes "Keep pushing forward!" "Stay focused!" "Believe in yourself!" "Make today amazing!" "Embrace the journey!" "One step at a time!"

    # Select a random quote
    set quote (random choice $quotes)

    # Set up greeting info
    set date_info (date "+📅 %A, %B %d, %Y")
    set quote_line "💡" "$quote"

    # Display the greeting
    echo -e "\n$time_of_day"
    echo -e "$date_info"
    echo -e "$quote_line\n"
end


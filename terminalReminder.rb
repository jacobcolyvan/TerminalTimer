# NOTE: To-do
#    -  can add pomodoro function
#    -  can add multiple timer functionality (from CL; requires threading)
#    -  benchmark tests for resources used, when using sleep, as compared to system time checks.

# makes window a predefined size
fork{ exec 'printf', "\e[8;20;25t"}
# sends window to top left corner
fork{ exec 'printf', "\e[3;0;0t"}

# demands command line Arguments 
timerLength = ARGV
#exits program if given no arguments
if timerLength == []
    exit
end
timerLength = timerLength[0].to_f
timerLengthinSeconds = (timerLength*60).to_i

# sends system notification through apple script notifying that timer has started
fork { exec ( "osascript -e 'display notification \"#{timerLength} minute timer is starting\" with title \"Timer starting\" sound name \"Submarine\"'" ) }
puts `clear`
# timer loop that notifies command line every 10 seconds.
while timerLengthinSeconds > 0
    if timerLengthinSeconds%10 == 0;
        puts "#{timerLengthinSeconds/60}:#{timerLengthinSeconds%60} min"
    end
    timerLengthinSeconds -= 1
    sleep(1)
end

# sends system notification through apple script when timer is up
fork { exec ( "osascript -e 'display notification \"#{timerLength} minutes is up\" with title \"Timer done\"'" ) }
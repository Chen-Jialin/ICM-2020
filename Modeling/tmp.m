result = matches;
for match = fullevents.MatchID
    for period = fullevents.MatchPeriod
        thisperiod = fullevent(fullevents.MatchID == match & fullevents.Period == period,:);
        for i = 1:size(thisperiod,1)
            if thisperiod.EventType(i) == "Pass"
                thisteam = thisperiod.TeamID;
                for j = i+1:size(thisperiod,1)
                    if (thisperiod.EventType(j) == "Pass") && thisperiod.TeamID(j) == thisteam
                        result(result.MatchID == match & result.)
                    elseif thisperiod.EventType(j) == "Dual"
                        continue
                    elseif thisperiod.Event
                    end
                    
                end
            end
        end
    end
end

thismatch = fullevents.MatchID(1);
thisteam = fullevents.TeamID(1);
for i = 1:size(fullevents,1)
    if fullevents.MatchPeriod ~= thisperiod
        %如果新的一场则刷新
        thismatch = fullevents.MatchID(i);
        thisteam = fullevents.TeamID(i);
    else
        %还是旧的一场则继续判断
        if fullevents.EventType(i) == "Pass"
            thisteam = fullevents.TeamID(i);
            for j = i+1:fullevents.row(fullevents.MatchID == thismatch && fullevents.MatchPeriod == thisperiod,end)
                if fullevents.EventType(j) == "Pass"
                    break
                elseif fullevents.EventSubType == "Duel" || fullevents.EventSubType == ""
                end
            end
        end
    end
end
result = matches;
for i = result.MatchID'
    result.meanx_huskies(i) = mean(passingevents.EventOrigin_x(passingevents.TeamID == 'Huskies' & passingevents.MatchID == i),1);
    result.meanx_rivals(i) = mean(passingevents.EventOrigin_x(passingevents.TeamID ~= 'Huskies' & passingevents.MatchID == i),1);
    
    result.meany_huskies(i) = mean(passingevents.EventOrigin_y(passingevents.TeamID == 'Huskies' & passingevents.MatchID == i),1);
    result.meany_rivals(i) = mean(passingevents.EventOrigin_y(passingevents.TeamID ~= 'Huskies' & passingevents.MatchID == i),1);
    
    result.std_huskies(i) = std(sqrt((passingevents.EventOrigin_x(passingevents.TeamID == 'Huskies' & passingevents.MatchID == i) - result.meanx_huskies(i)).^2 + (passingevents.EventOrigin_y(passingevents.TeamID == 'Huskies' & passingevents.MatchID == i) - result.meany_huskies(i)).^2));
    result.std_rivals(i) = std(sqrt((passingevents.EventOrigin_x(passingevents.TeamID ~= 'Huskies' & passingevents.MatchID == i) - result.meanx_rivals(i)).^2 + (passingevents.EventOrigin_y(passingevents.TeamID ~= 'Huskies' & passingevents.MatchID == i) - result.meany_rivals(i)).^2));
    
    result.stdx_huskies(i) = std(passingevents.EventOrigin_x(passingevents.TeamID == 'Huskies' & passingevents.MatchID == i));
    result.stdx_rivals(i) = std(passingevents.EventOrigin_x(passingevents.TeamID ~= 'Huskies' & passingevents.MatchID == i));
    
    result.stdy_huskies(i) = std(passingevents.EventOrigin_y(passingevents.TeamID == 'Huskies' & passingevents.MatchID == i));
    result.stdy_rivals(i) = std(passingevents.EventOrigin_y(passingevents.TeamID ~= 'Huskies' & passingevents.MatchID == i));
end
corrcoef(result.meanx_huskies - result.meanx_rivals,result.OwnScore - result.OpponentScore)
plot(result.meanx_huskies - result.meanx_rivals,result.OwnScore - result.OpponentScore,'.')
figure(2)
outcome = categorical({'win','tie','loss'});
meanx = [mean(result.meanx_huskies(result.Outcome == 'win') - result.meanx_rivals(result.Outcome == 'win')),mean(result.meanx_huskies(result.Outcome == 'tie') - result.meanx_rivals(result.Outcome == 'tie')),mean(result.meanx_huskies(result.Outcome == 'loss') - result.meanx_rivals(result.Outcome == 'loss'))];
bar(outcome,meanx)
xlabel('Outcome')
ylabel('<x> (Huskies - rivals)')

% corrcoef(result.meanx_huskies - result.meanx_rivals,result.OwnScore - result.OpponentScore)
% figure(3)
% plot(result.meanx_huskies - result.meanx_rivals,result.OwnScore - result.OpponentScore,'.')
% figure(4)
% outcome = categorical({'win','tie','loss'});
% meany = [mean(result.meany_huskies(result.Outcome == 'win') - result.meany_rivals(result.Outcome == 'win')),mean(result.meany_huskies(result.Outcome == 'tie') - result.meany_rivals(result.Outcome == 'tie')),mean(result.meany_huskies(result.Outcome == 'loss') - result.meany_rivals(result.Outcome == 'loss'))];
% bar(outcome,meany)
% xlabel('Outcome')
% ylabel('<y> (Huskies - rivals)')

corrcoef(result.meany_huskies - result.meany_rivals,result.OwnScore - result.OpponentScore)
figure(5)
plot(result.std_huskies - result.std_rivals,result.OwnScore - result.OpponentScore,'.')
figure(6)
outcome = categorical({'win','tie','loss'});
dispersion = [mean(result.std_huskies(result.Outcome == 'win') - result.std_rivals(result.Outcome == 'win')),mean(result.std_huskies(result.Outcome == 'tie') - result.std_rivals(result.Outcome == 'tie')),mean(result.std_huskies(result.Outcome == 'loss') - result.std_rivals(result.Outcome == 'loss'))];
bar(outcome,dispersion)
xlabel('Outcome')
ylabel('Dispersion (Huskies - rivals)')

% corrcoef(result.meanx_huskies - result.meanx_rivals,result.OwnScore - result.OpponentScore)
% figure(7)
% plot(result.stdy_huskies ./ result.stdx_huskies - result.stdx_rivals ./ result.stdy_rivals,result.OwnScore - result.OpponentScore,'.')
% figure(8)
% outcome = categorical({'win','tie','loss'});
% stdy_stdx = [mean(result.stdy_huskies(result.Outcome == 'win') ./ result.stdx_huskies(result.Outcome == 'win') - result.stdy_rivals(result.Outcome == 'win') ./ result.stdx_rivals(result.Outcome == 'win')),
%     mean(result.stdy_huskies(result.Outcome == 'tie') ./ result.stdx_huskies(result.Outcome == 'tie') - result.stdy_rivals(result.Outcome == 'tie') ./ result.stdx_rivals(result.Outcome == 'tie')),
%     mean(result.stdy_huskies(result.Outcome == 'loss') ./ result.stdx_huskies(result.Outcome == 'loss') - result.stdy_rivals(result.Outcome == 'loss') ./ result.stdx_rivals(result.Outcome == 'loss'))];
% bar(outcome,stdy_stdx)
% xlabel('Outcome')
% ylabel('stdy / stdx (Huskies - rivals)')
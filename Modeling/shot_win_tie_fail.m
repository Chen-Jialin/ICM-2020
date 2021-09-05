result = matches;
for i = result.MatchID'
    result.shot_huskies(i) = size(fullevents.MatchID(fullevents.TeamID == 'Huskies' & fullevents.MatchID == i & fullevents.EventType == 'Shot'),1);
    result.shot_rivals(i) = size(fullevents.MatchID(fullevents.TeamID ~= 'Huskies' & fullevents.MatchID == i & fullevents.EventType == 'Shot'),1);
end
corrcoef(result.shot_huskies - result.shot_rivals,result.OwnScore - result.OpponentScore)
plot(result.shot_huskies - result.shot_rivals,result.OwnScore - result.OpponentScore,'.')
figure(2)
outcome = categorical({'win','tie','loss'});
shot = [mean(result.shot_huskies(result.Outcome == 'win') - result.shot_rivals(result.Outcome == 'win')),mean(result.shot_huskies(result.Outcome == 'tie') - result.shot_rivals(result.Outcome == 'tie')),mean(result.shot_huskies(result.Outcome == 'loss') - result.shot_rivals(result.Outcome == 'loss'))];
bar(outcome,shot)
xlabel('Outcome')
ylabel('Shot (Huskies - rivals)')

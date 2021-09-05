result = matches;
for i = result.MatchID'
    result.pass_huskies(i) = size(passingevents.MatchID(passingevents.TeamID == 'Huskies' & passingevents.MatchID == i),1);
    result.pass_rivals(i) = size(passingevents.MatchID(passingevents.TeamID ~= 'Huskies' & passingevents.MatchID == i),1);
end
corrcoef(result.pass_huskies - result.pass_rivals,result.OwnScore - result.OpponentScore)
plot(result.pass_huskies - result.pass_rivals,result.OwnScore - result.OpponentScore,'.')
figure(2)
outcome = categorical({'win','tie','loss'});
pass = [mean(result.pass_huskies(result.Outcome == 'win') - result.pass_rivals(result.Outcome == 'win')),mean(result.pass_huskies(result.Outcome == 'tie') - result.pass_rivals(result.Outcome == 'tie')),mean(result.pass_huskies(result.Outcome == 'loss') - result.pass_rivals(result.Outcome == 'loss'))];
bar(outcome,pass)
xlabel('Outcome')
ylabel('Pass (Huskies - rivals)')

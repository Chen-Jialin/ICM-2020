% win = matches(matches.Outcome == 'win',:);
% tie = matches(matches.Outcome == 'tie',:);
% loss = matches(matches.Outcome == 'loss',:);
% 
% win_passing_events = passingevents(ismember(passingevents.MatchID,win.MatchID),:);
% tie_passing_events = passingevents(ismember(passingevents.MatchID,tie.MatchID),:);
% loss_passing_events = passingevents(ismember(passingevents.MatchID,loss.MatchID),:);

%! 规律：只有赢的场次的mean_x_huskies - meanx_rival是负的，应当保守一些，缩回线内 -1.3246 0.7101 0.0628
% meanx_huskies_win = mean([win_passing_events.EventOrigin_x(win_passing_events.TeamID == 'Huskies' & not(contains(win_passing_events.OriginPlayerID,'G')),:);win_passing_events.EventDestination_x(win_passing_events.TeamID == 'Huskies' & not(contains(win_passing_events.OriginPlayerID,'G')),:)]);
% meanx_huskies_tie = mean([tie_passing_events.EventOrigin_x(tie_passing_events.TeamID == 'Huskies' & not(contains(tie_passing_events.OriginPlayerID,'G')),:);tie_passing_events.EventDestination_x(tie_passing_events.TeamID == 'Huskies' & not(contains(tie_passing_events.OriginPlayerID,'G')),:)]);
% meanx_huskies_loss = mean([loss_passing_events.EventOrigin_x(loss_passing_events.TeamID == 'Huskies' & not(contains(loss_passing_events.OriginPlayerID,'G')),:);loss_passing_events.EventDestination_x(loss_passing_events.TeamID == 'Huskies' & not(contains(loss_passing_events.OriginPlayerID,'G')),:)]);
% meanx_rival_win = mean([win_passing_events.EventOrigin_x(win_passing_events.TeamID ~= 'Huskies' & not(contains(win_passing_events.OriginPlayerID,'G')),:);win_passing_events.EventDestination_x(win_passing_events.TeamID ~= 'Huskies' & not(contains(win_passing_events.OriginPlayerID,'G')),:)]);
% meanx_rival_tie = mean([tie_passing_events.EventOrigin_x(tie_passing_events.TeamID ~= 'Huskies' & not(contains(tie_passing_events.OriginPlayerID,'G')),:);tie_passing_events.EventDestination_x(tie_passing_events.TeamID ~= 'Huskies' & not(contains(tie_passing_events.OriginPlayerID,'G')),:)]);
% meanx_rival_loss = mean([loss_passing_events.EventOrigin_x(loss_passing_events.TeamID ~= 'Huskies' & not(contains(loss_passing_events.OriginPlayerID,'G')),:);loss_passing_events.EventDestination_x(loss_passing_events.TeamID ~= 'Huskies' & not(contains(loss_passing_events.OriginPlayerID,'G')),:)]);

%! 规律：赢的场次总体机动性远高于输的场次 2.5597 12.4542 -4.1942
% varx_huskies_win = var([win_passing_events.EventOrigin_x(win_passing_events.TeamID == 'Huskies' & not(contains(win_passing_events.OriginPlayerID,'G')),:);win_passing_events.EventDestination_x(win_passing_events.TeamID == 'Huskies' & not(contains(win_passing_events.OriginPlayerID,'G')),:)]);
% varx_huskies_tie = var([tie_passing_events.EventOrigin_x(tie_passing_events.TeamID == 'Huskies' & not(contains(tie_passing_events.OriginPlayerID,'G')),:);tie_passing_events.EventDestination_x(tie_passing_events.TeamID == 'Huskies' & not(contains(tie_passing_events.OriginPlayerID,'G')),:)]);
% varx_huskies_loss = var([loss_passing_events.EventOrigin_x(loss_passing_events.TeamID == 'Huskies' & not(contains(loss_passing_events.OriginPlayerID,'G')),:);loss_passing_events.EventDestination_x(loss_passing_events.TeamID == 'Huskies' & not(contains(loss_passing_events.OriginPlayerID,'G')),:)]);
% varx_rival_win = var([win_passing_events.EventOrigin_x(win_passing_events.TeamID ~= 'Huskies' & not(contains(win_passing_events.OriginPlayerID,'G')),:);win_passing_events.EventDestination_x(win_passing_events.TeamID ~= 'Huskies' & not(contains(win_passing_events.OriginPlayerID,'G')),:)]);
% varx_rival_tie = var([tie_passing_events.EventOrigin_x(tie_passing_events.TeamID ~= 'Huskies' & not(contains(tie_passing_events.OriginPlayerID,'G')),:);tie_passing_events.EventDestination_x(tie_passing_events.TeamID ~= 'Huskies' & not(contains(tie_passing_events.OriginPlayerID,'G')),:)]);
% varx_rival_loss = var([loss_passing_events.EventOrigin_x(loss_passing_events.TeamID ~= 'Huskies' & not(contains(loss_passing_events.OriginPlayerID,'G')),:);loss_passing_events.EventDestination_x(loss_passing_events.TeamID ~= 'Huskies' & not(contains(loss_passing_events.OriginPlayerID,'G')),:)]);

%! 规律：传球距离差越大，越可能输，应当减少传球距离
% delta_huskies_win = mean(sqrt((win_passing_events.EventOrigin_x(win_passing_events.TeamID == 'Huskies',:) - win_passing_events.EventDestination_x(win_passing_events.TeamID == 'Huskies',:)).^2 + (win_passing_events.EventOrigin_x(win_passing_events.TeamID == 'Huskies',:) - win_passing_events.EventDestination_x(win_passing_events.TeamID == 'Huskies',:)).^2));
% delta_huskies_tie = mean(sqrt((tie_passing_events.EventOrigin_x(tie_passing_events.TeamID == 'Huskies',:) - tie_passing_events.EventDestination_x(tie_passing_events.TeamID == 'Huskies',:)).^2 + (tie_passing_events.EventOrigin_x(tie_passing_events.TeamID == 'Huskies',:) - tie_passing_events.EventDestination_x(tie_passing_events.TeamID == 'Huskies',:)).^2));
% delta_huskies_loss = mean(sqrt((loss_passing_events.EventOrigin_x(loss_passing_events.TeamID == 'Huskies',:) - loss_passing_events.EventDestination_x(loss_passing_events.TeamID == 'Huskies',:)).^2 + (loss_passing_events.EventOrigin_x(loss_passing_events.TeamID == 'Huskies',:) - loss_passing_events.EventDestination_x(loss_passing_events.TeamID == 'Huskies',:)).^2));
% delta_rival_win = mean(sqrt((win_passing_events.EventOrigin_x(win_passing_events.TeamID ~= 'Huskies',:) - win_passing_events.EventDestination_x(win_passing_events.TeamID ~= 'Huskies',:)).^2 + (win_passing_events.EventOrigin_x(win_passing_events.TeamID ~= 'Huskies',:) - win_passing_events.EventDestination_x(win_passing_events.TeamID ~= 'Huskies',:)).^2));
% delta_rival_tie = mean(sqrt((tie_passing_events.EventOrigin_x(tie_passing_events.TeamID ~= 'Huskies',:) - tie_passing_events.EventDestination_x(tie_passing_events.TeamID ~= 'Huskies',:)).^2 + (tie_passing_events.EventOrigin_x(tie_passing_events.TeamID ~= 'Huskies',:) - tie_passing_events.EventDestination_x(tie_passing_events.TeamID ~= 'Huskies',:)).^2));
% delta_rival_loss = mean(sqrt((loss_passing_events.EventOrigin_x(loss_passing_events.TeamID ~= 'Huskies',:) - loss_passing_events.EventDestination_x(loss_passing_events.TeamID ~= 'Huskies',:)).^2 + (loss_passing_events.EventOrigin_x(loss_passing_events.TeamID ~= 'Huskies',:) - loss_passing_events.EventDestination_x(loss_passing_events.TeamID ~= 'Huskies',:)).^2));


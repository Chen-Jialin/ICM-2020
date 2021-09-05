result = table();
result.matches = [1:38]';
result.score_huskies = matches.OwnScore;
result.score_rivals = matches.OpponentScore;
for i = 1:38
    huskies = passing_huskies(passing_huskies.MatchID == i & all('G' ~= passing_huskies.OriginPlayerID),:);

    result.meanx_huskies(i) = mean((huskies.EventOrigin_x + huskies.EventDestination_x) / 2);
    result.meany_huskies(i) = mean((huskies.EventOrigin_y + huskies.EventDestination_y) / 2);
    result.varx_huskies(i) = var([huskies.EventOrigin_x;huskies.EventDestination_x]);
    result.vary_huskies(i) = var([huskies.EventOrigin_y;huskies.EventDestination_y]);
    result.deltax_huskies(i) = mean(-huskies.EventOrigin_x + huskies.EventDestination_x);
    result.deltay_huskies(i) = mean(-huskies.EventOrigin_y + huskies.EventDestination_y);
    result.delta_huskies(i) = mean(sqrt((-huskies.EventOrigin_x + huskies.EventDestination_x).^2 + (-huskies.EventOrigin_y + huskies.EventDestination_y).^2));
    
%     huskies = full_huskies();
%     result.interactionFF(i) = mean(sqrt(-huskies.OriginPlayerID));
    
%     huskies = full_huskies(full_huskies.MatchID == i & full_huskies.EventType == 'Shot',:);
%     result.shot_huskies(i) = size(huskies,1);
%     result.shotdistance_huskies(i) = mean(sqrt((100 - huskies.EventOrigin_x).^2 + (50 - huskies.EventOrigin_y).^2));
    
    
    rivals = passing_rivals(passing_rivals.MatchID == i,:);% & all('G' ~= passing_rivals.OriginPlayerID),:);
    result.meanx_rivals(i) = mean((rivals.EventOrigin_x + rivals.EventDestination_x) / 2);
    result.meany_rivals(i) = mean((rivals.EventOrigin_y + rivals.EventDestination_y) / 2);
    result.varx_rivals(i) = var([rivals.EventOrigin_x;rivals.EventDestination_x]);
    result.deltax_rivals(i) = mean(-rivals.EventOrigin_x + rivals.EventDestination_x);
    result.deltay_rivals(i) = mean(-rivals.EventOrigin_y + rivals.EventDestination_y);
    result.delta_rivals(i) = mean(sqrt((-rivals.EventOrigin_x + rivals.EventDestination_x).^2 + (-rivals.EventOrigin_y + rivals.EventDestination_y).^2));
end

plot(result.varx_huskies - result.varx_rivals,result.score_huskies - result.score_rivals,'.','markersize',16)
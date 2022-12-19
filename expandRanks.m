function zeros_arr=expandRanks(ranks,Height,Width,Default)
  zeros_arr=zeros(Height,Width);
  for h=1:Height
    if height(ranks) < h
        zeros_arr(h,:)=Default;
        break;
    end
    for w=1:Width
      if width(ranks) < w
        zeros_arr(h,w)=Default;
        % break;
        
        continue;
      else
          zeros_arr(h,w)=ranks(h,w);
      end
    end
  end
end

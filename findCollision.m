function i = findCollision(index, hash)
found = 0; %boolean value
i = 1;
while(found==0)
    if(hash((2*i)-1, index)==0)
        found = 1;
    end
    if(found == 0)
        i = i+1;
    end
end
i = (2*i)-1;
end


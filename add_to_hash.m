function hashTable = add_to_hash(song, current_db, song_id)

db = make_table(char(song));
if(isempty(current_db))
    hashTable = zeros(50, size(db,1));
end

for i=1:size(db,1)
    %index = ((db(i,4)-db(i,3))*(2^16))+((db(i,1)-1)*(2^8))+((db(i,2)-1)); %h(f1,f2,t2-t1)
    index = mod(floor(((db(i,4)-db(i,3))*(2^16))+(abs(db(i,1))*(2^8))+abs(db(i,2))), size(hashTable,2))+1;
    %handles collisions
    collisionIndex = findCollision(ceil(abs(index)), hashTable);
    hashTable(collisionIndex, ceil(abs(index))) = db(i,3);
    hashTable(collisionIndex+1, ceil(abs(index))) = size(song_id,1);
end
save('hashTable.mat', 'hashTable', '-v7.3');
save('song_id.mat', 'song_id');
end
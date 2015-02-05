function [db,song_id,hTSizes] = make_database(songs,current_db)
db = [];
song_id = [];
hTSizes = [];
for i=1:size(songs,1)
    song_id=[song_id;cellstr(songs(i,1))];
    curr = add_to_hash(songs(i,1),current_db, song_id);
    db = [db,curr];
    hTSizes = [hTSizes, size(curr, 2)];
end
end
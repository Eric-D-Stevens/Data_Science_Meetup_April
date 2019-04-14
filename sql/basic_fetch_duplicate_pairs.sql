-- @jordan
-- This fetches all the Post table columns for a duplicate post and its original post.
select 

op.Id OriginalPostId , 
op.PostTypeId OriginalPostPostTypeId , 
op.AcceptedAnswerId OriginalPostAcceptedAnswerId , 
op.ParentId OriginalPostParentId , 
op.CreationDate OriginalPostCreationDate , 
op.DeletionDate OriginalPostDeletionDate , 
op.Score OriginalPostScore , 
op.ViewCount OriginalPostViewCount , 
op.Body OriginalPostBody , 
op.OwnerUserId OriginalPostOwnerUserId , 
op.OwnerDisplayName OriginalPostOwnerDisplayName , 
op.LastEditorUserId OriginalPostLastEditorUserId , 
op.LastEditorDisplayName OriginalPostLastEditorDisplayName , 
op.LastEditDate OriginalPostLastEditDate , 
op.LastActivityDate OriginalPostLastActivityDate , 
op.Title OriginalPostTitle , 
op.Tags OriginalPostTags , 
op.AnswerCount OriginalPostAnswerCount , 
op.CommentCount OriginalPostCommentCount , 
op.FavoriteCount OriginalPostFavoriteCount , 
op.ClosedDate OriginalPostClosedDate , 
op.CommunityOwnedDate OriginalPostCommunityOwnedDate , 

dupl.Id DuplicatePostId , 
dupl.PostTypeId DuplicatePostPostTypeId , 
dupl.AcceptedAnswerId DuplicatePostAcceptedAnswerId , 
dupl.ParentId DuplicatePostParentId , 
dupl.CreationDate DuplicatePostCreationDate , 
dupl.DeletionDate DuplicatePostDeletionDate , 
dupl.Score DuplicatePostScore , 
dupl.ViewCount DuplicatePostViewCount , 
dupl.Body DuplicatePostBody , 
dupl.OwnerUserId DuplicatePostOwnerUserId , 
dupl.OwnerDisplayName DuplicatePostOwnerDisplayName , 
dupl.LastEditorUserId DuplicatePostLastEditorUserId , 
dupl.LastEditorDisplayName DuplicatePostLastEditorDisplayName , 
dupl.LastEditDate DuplicatePostLastEditDate , 
dupl.LastActivityDate DuplicatePostLastActivityDate , 
dupl.Title DuplicatePostTitle , 
dupl.Tags DuplicatePostTags , 
dupl.AnswerCount DuplicatePostAnswerCount , 
dupl.CommentCount DuplicatePostCommentCount , 
dupl.FavoriteCount DuplicatePostFavoriteCount , 
dupl.ClosedDate DuplicatePostClosedDate , 
dupl.CommunityOwnedDate DuplicatePostCommunityOwnedDate

from posts op 
join postlinks pl on op.id = pl.relatedpostid
join posts dupl on pl.postid = dupl.id
where  op.posttypeid = 1 -- Question post
and pl.linktypeid = 3 -- duplicate

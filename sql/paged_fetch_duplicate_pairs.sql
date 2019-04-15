-- Selects a "page" of duplicate pairs of questions from StackOverflow posts.
-- This query is a slight modification of:
--   https://github.com/Eric-D-Stevens/Data_Science_Meetup_April/blob/master/sql/basic_fetch_duplicate_pairs.sql
-- Usage:
--   https://data.stackexchange.com/stackoverflow/query/1029995/duplicate-pairs-of-questions-related-to-r-or-python?PageSize=40000&PageNumber=1
-- will retrieve the first 40,000 records.
-- Then you can call again with PageNumber=2 to get the next 40,000 records.
--
-- When you run this query in the StackOverflow query page, it will
-- prompt you for the values of PageSize and PageNumber.

DECLARE @PageSize int = ##PageSize##
DECLARE @PageNumber int = ##PageNumber##

SELECT 
  op.Id OriginalPostId, 
  op.PostTypeId OriginalPostPostTypeId, 
  op.AcceptedAnswerId OriginalPostAcceptedAnswerId, 
  op.ParentId OriginalPostParentId, 
  op.CreationDate OriginalPostCreationDate, 
  op.DeletionDate OriginalPostDeletionDate, 
  op.Score OriginalPostScore, 
  op.ViewCount OriginalPostViewCount, 
  op.Body OriginalPostBody, 
  op.OwnerUserId OriginalPostOwnerUserId, 
  op.OwnerDisplayName OriginalPostOwnerDisplayName, 
  op.LastEditorUserId OriginalPostLastEditorUserId, 
  op.LastEditorDisplayName OriginalPostLastEditorDisplayName, 
  op.LastEditDate OriginalPostLastEditDate, 
  op.LastActivityDate OriginalPostLastActivityDate, 
  op.Title OriginalPostTitle, 
  op.Tags OriginalPostTags, 
  op.AnswerCount OriginalPostAnswerCount, 
  op.CommentCount OriginalPostCommentCount, 
  op.FavoriteCount OriginalPostFavoriteCount, 
  op.ClosedDate OriginalPostClosedDate, 
  op.CommunityOwnedDate OriginalPostCommunityOwnedDate, 

  dupl.Id DuplicatePostId, 
  dupl.PostTypeId DuplicatePostPostTypeId, 
  dupl.AcceptedAnswerId DuplicatePostAcceptedAnswerId, 
  dupl.ParentId DuplicatePostParentId, 
  dupl.CreationDate DuplicatePostCreationDate, 
  dupl.DeletionDate DuplicatePostDeletionDate, 
  dupl.Score DuplicatePostScore, 
  dupl.ViewCount DuplicatePostViewCount, 
  dupl.Body DuplicatePostBody, 
  dupl.OwnerUserId DuplicatePostOwnerUserId, 
  dupl.OwnerDisplayName DuplicatePostOwnerDisplayName, 
  dupl.LastEditorUserId DuplicatePostLastEditorUserId, 
  dupl.LastEditorDisplayName DuplicatePostLastEditorDisplayName, 
  dupl.LastEditDate DuplicatePostLastEditDate, 
  dupl.LastActivityDate DuplicatePostLastActivityDate, 
  dupl.Title DuplicatePostTitle, 
  dupl.Tags DuplicatePostTags, 
  dupl.AnswerCount DuplicatePostAnswerCount, 
  dupl.CommentCount DuplicatePostCommentCount, 
  dupl.FavoriteCount DuplicatePostFavoriteCount, 
  dupl.ClosedDate DuplicatePostClosedDate, 
  dupl.CommunityOwnedDate DuplicatePostCommunityOwnedDate

FROM posts op 
  JOIN postlinks pl ON op.id = pl.relatedpostid
  JOIN posts dupl ON pl.postid = dupl.id
WHERE
  op.posttypeid = 1      -- Question post
  AND pl.linktypeid = 3  -- duplicate
ORDER BY op.Id 
  OFFSET @PageSize * (@PageNumber - 1) ROWS
  FETCH NEXT @PageSize ROWS ONLY;

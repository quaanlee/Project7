use Project7
go
create trigger trg_update_topicStatus
on Topics
after update
as begin
	if exists (select 1 
	from inserted i inner join deleted d on d.topicId = i.topicId
	where i.topicStatus='Received' and d.topicStatus != 'Received') 
	begin
		update r set r.registerStatus ='Rejected'
		from Registers r inner join inserted i on i.topicId = r.topicId
		where r.registerStatus = 'Awaiting Approval'
	end;
end;

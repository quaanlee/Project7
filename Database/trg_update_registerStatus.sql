use Project7
go
--drop trigger if exists trg_update_registerStatus
create trigger trg_update_registerStatus
on Registers
after update
as begin
	if exists
	(select 1 from inserted i 
	inner join deleted d on d.teamId = i.teamId
	where d.topicId = i.topicId and i.registerStatus = 'Approved' and d.registerStatus != 'Approved')
	begin
		insert into Reports (teamId, category, filePath, submitDate, deadline)
		select i.teamId,r.category, null, getdate(), getdate()
		from inserted i
		cross join (
			select 'Proposal' as category
			union
			select 'Report 1'
			union
			select 'Report 2'
			union
			select 'FinalReport'
		)r

		insert into MarkTeam (teamId, proposal, report_1, report_2, finalReport)
		select i.teamId, null, null, null, null
		from inserted i

		insert into FinalMark (studentId, teamId, markPersonal, total)
		select im.studentId, im.teamId, null, null
		from (select i.*, m.studentId from inserted i left join MembersInTeam m on m.teamId = i.teamId)im
	end;

	if exists
	(select 1 from inserted i 
	inner join deleted d on d.teamId = i.teamId
	where d.topicId = i.topicId and i.registerStatus != 'Approved' and d.registerStatus = 'Approved')
	begin
		delete r from Reports r
		inner join inserted i on i.teamId = r.teamId

		delete mt from MarkTeam mt
		inner join inserted i on i.teamId = mt.teamId

		delete fm from FinalMark fm
		inner join (select m.* from inserted i
		inner join MembersInTeam m on m.teamId = i.teamId) st
		on st.studentId = fm.studentId
	end;
end;
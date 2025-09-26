begin tran
update farmacos set frm_tipo_pk = '100519' where frm_cod = 'FCS060'
commit tran

begin tran
update farmacos set frm_tipo_pk = '100506' where frm_cod = 'FIC130'
commit tran
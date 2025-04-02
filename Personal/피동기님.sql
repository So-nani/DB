-- ���ǻ��̸��� �Ű������� �Է¹޾� �ش� ���ǻ��� å�� �ִ밡���� ����ϴ� ���ν���(å�̸�, ����)

create or replace procedure bk_maxprice_p (
    p_bkpub in book.bk_pub%type
) is
    v_bk_price book.bk_price%type;
    v_bk_name book.bk_name%type;
begin
    select bk_price, bk_name into v_bk_price, v_bk_name
        from book where bk_pub=p_bkpub 
        and bk_price =(select max(bk_price) from book where bk_pub=p_bkpub);
    dbms_output.put_line
    (p_bkpub || '���ǻ��� ���� '||v_bk_name||'�� �ִ밡��:'|| v_bk_price);

END;
/

accept p_bkpublic prompt '�˻��� ���ǻ縦 �Է��ϼ���'
exec bk_maxprice_p('&p_bkpublic');
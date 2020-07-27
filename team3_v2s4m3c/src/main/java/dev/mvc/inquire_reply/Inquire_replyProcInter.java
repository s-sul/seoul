package dev.mvc.inquire_reply;
import java.util.List;
import java.util.Map;

public interface Inquire_replyProcInter {
  /**
   * <xmp>
   * 1:1���� ��� ���
   * <insert id="create">
   * @param inquire_replyVO
   * @return
   * </xmp>
   */
  public int create(Inquire_replyVO inquire_replyVO);
  
  /**
   * <xmp>
   * 1:1���� ��� ��ü ���
   * <select id="list" resultType="Inquire_replyVO">
   * @return
   * </xmp>
   */
  public List<Inquire_replyVO> list();
   
  /**
   * <xmp>
   * inquireno �� ���
   * <select id="list_by_inquireno" resultType="Inquire_replyVO" parameterType="int">
   * @param inquireno ���� ��ȣ
   * @return
   * </xmp>
   */
  public List<Inquire_replyVO> list_by_inquireno(int inquireno);
    
  /**
   * <xmp>
   * ȸ�� ID ���
   * <select id="list_by_inquireno_join" resultType="Inquire_replyMemberVO" parameterType="int"> 
   * @param inquireno ���� ��ȣ
   * @return
   * </xmp>
   */
  public List<Inquire_replyMemberVO> list_by_inquireno_join(int inquireno);
  
  /**
   * <xmp>
   * �н����� �˻�
   * <select id="checkPasswd" parameterType="Map" resultType="int"> 
   * @param map
   * @return
   * </xmp>
   */
  public int checkPasswd(Map<String, Object> map);
   
  /**
   * 1:1���� ��� ����
   * <delete id="delete" parameterType="int"> 
   * @param inquire_replyno ��� ��ȣ
   * @return
   */
  public int delete(int inquire_replyno);
  
}

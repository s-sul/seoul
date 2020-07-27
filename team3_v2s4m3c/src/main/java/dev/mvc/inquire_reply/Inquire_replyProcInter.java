package dev.mvc.inquire_reply;
import java.util.List;
import java.util.Map;

public interface Inquire_replyProcInter {
  /**
   * <xmp>
   * 1:1문의 댓글 등록
   * <insert id="create">
   * @param inquire_replyVO
   * @return
   * </xmp>
   */
  public int create(Inquire_replyVO inquire_replyVO);
  
  /**
   * <xmp>
   * 1:1문의 댓글 전체 목록
   * <select id="list" resultType="Inquire_replyVO">
   * @return
   * </xmp>
   */
  public List<Inquire_replyVO> list();
   
  /**
   * <xmp>
   * inquireno 별 목록
   * <select id="list_by_inquireno" resultType="Inquire_replyVO" parameterType="int">
   * @param inquireno 문의 번호
   * @return
   * </xmp>
   */
  public List<Inquire_replyVO> list_by_inquireno(int inquireno);
    
  /**
   * <xmp>
   * 회원 ID 출력
   * <select id="list_by_inquireno_join" resultType="Inquire_replyMemberVO" parameterType="int"> 
   * @param inquireno 문의 번호
   * @return
   * </xmp>
   */
  public List<Inquire_replyMemberVO> list_by_inquireno_join(int inquireno);
  
  /**
   * <xmp>
   * 패스워드 검사
   * <select id="checkPasswd" parameterType="Map" resultType="int"> 
   * @param map
   * @return
   * </xmp>
   */
  public int checkPasswd(Map<String, Object> map);
   
  /**
   * 1:1문의 댓글 삭제
   * <delete id="delete" parameterType="int"> 
   * @param inquire_replyno 댓글 번호
   * @return
   */
  public int delete(int inquire_replyno);
  
}

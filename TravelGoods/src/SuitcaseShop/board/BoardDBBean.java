package SuitcaseShop.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
	// 싱글톤 패턴 - 인스턴스를 내부에서 생성해 리턴값으로 돌려준다. 외부에서 직접 생성을 제한
	private static BoardDBBean instance = new BoardDBBean();
	
	public static BoardDBBean getInstance() {
		return instance;
	}
	// default 생성자는 public이 붙어 나오므로 이를 방지. 외부에서는 간접생성만 가능하도록,
	private BoardDBBean() { }
	
	// 1번 방법 - JDBC 드라이버를 사용하는 방법 (암기필수)
	/*private Connection getConnection() throws Exception{
		Connection conn = null;
		String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp";
		String dbId = "jspid";
		String dbPasswd = "jsppass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPasswd);
		return conn;
	}*/
	
	// 2번 방법 - Connection Pool로부터 Connection 객체를 얻어냄
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
		return ds.getConnection();		
	}
	
	// board 테이블에 글을 추가(insert문) <= writePro.jsp 페이지에서 사용
	public void insertArticle(BoardDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		int number = 0;
		String sql = "";
		
		try {
			conn = getConnection();
			// 게시판에 가장 높은 글 번호(최근 글 번호) 조회
			sql = "select max(num) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			// 새 글이 있느냐? 있다면 진입.
			if(rs.next()) {
				number = rs.getInt(1)+1;
			} else {
				number = 1;
			}
			
			if(num != 0) {
				// 글 번호가 0이 아닐 때의 댓글 순서와 댓글 깊이 설정
				sql = "update board set re_step = re_step+1 where ref = ? and re_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				
				re_step = re_step + 1;
				re_level = re_level + 1;
			} else {
				ref = number;
				re_step = 0;
				re_level = 0;
			}
			
			// 정보입력 쿼리를 작성
			sql = "insert into board(num, writer, email, subject, passwd, reg_date, "
				+ "ref, re_step, re_level, content, ip) values(?,?,?,?,?,?,?,?,?,?,?)";			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, number);
			pstmt.setString(2, article.getWriter());
			pstmt.setString(3, article.getEmail());
			pstmt.setString(4, article.getSubject());
			pstmt.setString(5, article.getPasswd());
			pstmt.setTimestamp(6, article.getReg_date());
			pstmt.setInt(7, ref);
			pstmt.setInt(8, re_step);
			pstmt.setInt(9, re_level);
			pstmt.setString(10, article.getContent());
			pstmt.setString(11, article.getIp());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); } }
			if(pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); } }
			if(conn != null) { try { conn.close(); } catch (Exception e) { e.printStackTrace(); } }
		}
	}
	// board 테이블에 저장된 전체 글의 개수를 얻어냄(select문) <= list.jsp에서 사용
	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;		
		String sql = "";
		
		try {
			conn = getConnection();
			// 
			sql = "select count(*) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); } }
			if(pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); } }
			if(conn != null) { try { conn.close(); } catch (Exception e) { e.printStackTrace(); } }
		}
		
		return x;
	}
	// 글의 목록(복수 개의 글)을 가져옴(select문) <= list.jsp에서 사용
	public List<BoardDataBean> getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<BoardDataBean> articleList = null;
		
		String sql = "";
		try {
			conn = getConnection();
			// p.503 limit은 mysql에 있는 구문. 읽어올 글 개수의 한계를 정한다.
			// MySQL
			/*sql = "select * from board order by ref desc, re_level asc, re_step desc limit ?, ?";*/
			
			//Oracle
			sql = "select * from "
					+ "(select rownum as rnum, bo.* "
					+ "from (select * from board order by ref desc, re_level asc, re_step desc) bo) "
					+ "where rnum between ? and ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start); // db의 레코드의 번호와 자바의 배열 번호는 1개 차이난다(0부터 시작)
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				articleList = new ArrayList<BoardDataBean>(end);
				
				do {
					BoardDataBean article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					
					articleList.add(article);
					
				} while(rs.next());
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); } }
			if(pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); } }
			if(conn != null) { try { conn.close(); } catch (Exception e) { e.printStackTrace(); } }
		}
		
		return articleList;
	}
	// 글의 내용을 보기(1개의 글) (select 문) <= content.jsp 페이지에서 사용
	public BoardDataBean getArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		
		String sql = "";		
		try {
			conn = getConnection();
			
			sql = "update board set readcount = readcount+1 where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			sql = "select * from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); } }
			if(pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); } }
			if(conn != null) { try { conn.close(); } catch (Exception e) { e.printStackTrace(); } }
		}
		
		return article;
	}
	// 글수정 폼에서 사용할 글의 내용(1개의 글) (select문) <= updateForm.jsp 페이지에서 사용
	public BoardDataBean updateGetArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		
		String sql = "";
		try {
			conn = getConnection();
			
			sql = "select * from board where num = ?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));				
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); } }
			if(pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); } }
			if(conn != null) { try { conn.close(); } catch (Exception e) { e.printStackTrace(); } }
		}
		
		return article;
	}
	// 글수정 처리에서 사용(update문) <= updatePro.jsp 페이지에서 사용
	public int updateArticle(BoardDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		String dbpasswd = "";
		String sql = "";
		int x = -1;
		
		try {
			conn = getConnection();
			
			sql = "select passwd from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(article.getPasswd())) {
					sql = "update board set "
							+ "writer = ?, email = ?, "
							+ "subject = ?, passwd = ?, "
							+ "content = ? where num = ?";
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getPasswd());
					pstmt.setString(5, article.getContent());
					pstmt.setInt(6, article.getNum());
					
					pstmt.executeUpdate();
					
					x = 1; // 글 수정 성공
				} else {
					x = 0; // 글 수정 실패(비밀번호 오류)
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); } }
			if(pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); } }
			if(conn != null) { try { conn.close(); } catch (Exception e) { e.printStackTrace(); } }
		}
		
		return x;
		
	}
	// 글삭제 처리시 사용 (delete문) <= deletePro.jsp 페이지에서 사용	
	public int deleteArticle(int num, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbpasswd = "";
		int x = -1;		
		String sql = "";
		try {
			conn = getConnection();
			
			sql = "select passwd from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");		
				
				if(dbpasswd.equals(passwd)) {
					sql = "delete from board where num = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, num);
					
					pstmt.executeUpdate();
					
					x = 1; // 글삭제 성공
				} else {
					x = 0; // 글삭제 실패(비밀번호 오류)
				}
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); } }
			if(pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); } }
			if(conn != null) { try { conn.close(); } catch (Exception e) { e.printStackTrace(); } }
		}
		
		return x;
	}
}

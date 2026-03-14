/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Topic;

/**
 *
 * @author LENOVO
 */
public class TopicDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;

    public boolean deleteTopicById(String topicId) {

        try {
            String strSQL = "delete Topics "
                    + "where topicId = ?";
            stm = connection.prepareStatement(strSQL);

            stm.setString(1, topicId);
            while (stm.executeUpdate() != 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return false;
    }

    public boolean editTopicById(String topicId, String topicName, String status) {

        try {
            String strSQL = "update Topics set topicName=?, "
                    + "topicStatus=? where topicId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, topicName);
            stm.setString(2, status);
            stm.setString(3, topicId);
            while (stm.executeUpdate() != 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return false;
    }

    public boolean insertNewTopic(String nameTopic, String teacherId) {
        String id = getNewTopicID();
        try {
            String strSQL = "insert into Topics (topicId, topicName, teacherId)"
                    + " values (?, ?, ?)";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, id);
            stm.setString(2, nameTopic);
            stm.setString(3, teacherId);
            while (stm.executeUpdate() != 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return false;
    }

    public String getNewTopicID() {
        String id = "TP01";
        try {
            String strSQL = "select top 1 topicId from Topics order by topicId desc";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                id = rs.getString("topicId");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        if (id != null) {
            int stt = Integer.parseInt(id.substring(2));
            stt++;
            id = "TP" + (stt < 10 ? "0" + stt : stt);
        }
        return id;
    }

    public Topic getTopicById(String id) {
        Topic topic = null;
        try {
            String strSQL = "select * from Topics where topicId=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                String topicId = rs.getString("topicId");
                String topicName = rs.getString("topicName");
                String teacherId = rs.getString("teacherId");
                String status = rs.getString("topicStatus");

                topic = new Topic(topicId, topicName, teacherId, status);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return topic;
    }

    public Topic getTopicByTeamId(String id) {
        Topic topic = null;
        try {
            String strSQL = "select t.* from Registers r\n"
                    + "  left join Topics t on t.topicId = r.topicId\n"
                    + "  where r.teamId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                String topicId = rs.getString("topicId");
                String topicName = rs.getString("topicName");
                String teacherId = rs.getString("teacherId");
                String status = rs.getString("topicStatus");

                topic = new Topic(topicId, topicName, teacherId, status);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return topic;
    }

    public List getTopicList() {
        List<Topic> topicList = new ArrayList<>();
        try {
            String strSQL = "select * from Topics";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String topicId = rs.getString("topicId");
                String topicName = rs.getString("topicName");
                String teacherId = rs.getString("teacherId");
                String status = rs.getString("topicStatus");

                Topic topic = new Topic(topicId, topicName, teacherId, status);
                topicList.add(topic);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return topicList;
    }

    public List getTopicListByID(String id) {
        List<Topic> topicList = new ArrayList<>();
        try {
            String strSQL = "select * from Topics where topicId like ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, "%" + id + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                String topicId = rs.getString("topicId");
                String topicName = rs.getString("topicName");
                String teacherId = rs.getString("teacherId");
                String status = rs.getString("topicStatus");

                Topic topic = new Topic(topicId, topicName, teacherId, status);
                topicList.add(topic);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return topicList;
    }

    public List getTopicListByEmail(String email) {
        List<Topic> topicList = new ArrayList<>();
        try {
            String strSQL = "select * from Topics t "
                    + "left join Teachers te on te.teacherId = t.teacherId "
                    + "where email=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, email);
            rs = stm.executeQuery();
            while (rs.next()) {
                String topicId = rs.getString("topicId");
                String topicName = rs.getString("topicName");
                String teacherId = rs.getString("teacherId");
                String status = rs.getString("topicStatus");

                Topic topic = new Topic(topicId, topicName, teacherId, status);
                topicList.add(topic);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return topicList;
    }
}

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
}

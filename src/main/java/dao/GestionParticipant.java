package dao;

import entities.Participant;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import java.util.List;

public class GestionParticipant implements IParticipant {


    EntityManagerFactory emf = Persistence.createEntityManagerFactory("eventPU");
    EntityManager em = emf.createEntityManager();

    public void addParticipant(Participant p) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            em.persist(p);  
            transaction.commit();
        } catch (RuntimeException e1) {
            transaction.rollback();
            throw e1; 
        }
    }

    public void deleteParticipant(int id) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            Participant participant = em.find(Participant.class, id);
            if (participant != null) {
                em.remove(participant); 
            }
            transaction.commit();
        } catch (RuntimeException e1) {
            transaction.rollback();
            throw e1; 
        }
    }

    public Participant getParticipant(int id) {
        return em.find(Participant.class, id);  
    }

    public List<Participant> getAllParticipants() {
        return em.createQuery("SELECT p FROM Participant p", Participant.class).getResultList(); 
    }
  
    public List<Participant> getParticipantsByEventId(int eventId) {
        return em.createQuery("SELECT p FROM Participant p JOIN p.evenements e WHERE e.id = :eventId", Participant.class)
                 .setParameter("eventId", eventId)
                 .getResultList();
    }

}

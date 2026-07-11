package dao;

import entities.Evenement;
import entities.Organisateur;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.List;

public class GestionEvenement implements IEvenement {

    private static EntityManagerFactory emf;

    static {
        try {
            emf = Persistence.createEntityManagerFactory("eventPU");
        } catch (Exception e) {
            System.err.println("Échec de la création d'EntityManagerFactory :");
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        }
    }

    private EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void addEvenement(Evenement e) {
        EntityManager em = getEntityManager();
        EntityTransaction transaction = null;
        try {
            transaction = em.getTransaction();
            transaction.begin();
            em.persist(e);
            transaction.commit();
        } catch (RuntimeException e1) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw e1;
        } finally {
            em.close();
        }
    }

    public void deleteEvenement(int id) {
        EntityManager em = getEntityManager();
        EntityTransaction transaction = null;
        try {
            transaction = em.getTransaction();
            transaction.begin();
            Evenement evenement = em.find(Evenement.class, id);
            if (evenement != null) {
                em.remove(evenement);
            }
            transaction.commit();
        } catch (RuntimeException e1) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw e1;
        } finally {
            em.close();
        }
    }

    public void updateEvenement(Evenement e) {
        EntityManager em = getEntityManager();
        EntityTransaction transaction = null;
        try {
            transaction = em.getTransaction();
            transaction.begin();
            em.merge(e);
            transaction.commit();
        } catch (RuntimeException e1) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw e1;
        } finally {
            em.close();
        }
    }

    public List<Evenement> getAllEvenements() {
        EntityManager em = getEntityManager();
        try {
            return em.createQuery("SELECT e FROM Evenement e JOIN FETCH e.organisateur", Evenement.class)
                     .getResultList();
        } finally {
            em.close();
        }
    }

    public Evenement getEvenement(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Evenement.class, id);
        } finally {
            em.close();
        }
    }

    public List<Evenement> getEventsBMY(String motCle) {
        EntityManager em = getEntityManager();
        try {
            return em.createQuery("SELECT e FROM Evenement e WHERE e.nom LIKE :mc", Evenement.class)
                     .setParameter("mc", "%" + motCle + "%")
                     .getResultList();
        } finally {
            em.close();
        }
    }

    public List<Organisateur> getAllOrganisateurs() {
        EntityManager em = getEntityManager();
        try {
            return em.createQuery("SELECT o FROM Organisateur o", Organisateur.class)
                     .getResultList();
        } finally {
            em.close();
        }
    }

    public Organisateur getOrganisateurById(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Organisateur.class, id);
        } finally {
            em.close();
        }
    }
}
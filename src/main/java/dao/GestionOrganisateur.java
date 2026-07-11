package dao;

import entities.Organisateur;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.List;

public class GestionOrganisateur implements IOrganisateur {

    private EntityManagerFactory emf;
    private EntityManager em;

    public GestionOrganisateur() {
        emf = Persistence.createEntityManagerFactory("eventPU");
        em = emf.createEntityManager();
    }

    
    public void addOrganisateur(Organisateur o) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            em.persist(o);
            transaction.commit();
        } catch (RuntimeException e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }

    
    public void deleteOrganisateur(int id) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            Organisateur organisateur = em.find(Organisateur.class, id);
            if (organisateur != null) {
                em.remove(organisateur);
            }
            transaction.commit();
        } catch (RuntimeException e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }

    
    public Organisateur getOrganisateur(int id) {
        try {
            return em.find(Organisateur.class, id);
        } catch (RuntimeException e) {
            throw new RuntimeException("Organisateur non trouvé avec l'ID: " + id, e);
        }
    }

    
    public List<Organisateur> getAllOrganisateurs() {
        try {
            String jpql = "SELECT o FROM Organisateur o";
            TypedQuery<Organisateur> query = em.createQuery(jpql, Organisateur.class);
            return query.getResultList();
        } catch (RuntimeException e) {
            throw new RuntimeException("Erreur lors de la récupération des organisateurs", e);
        }
    }

    public void close() {
        if (em != null && em.isOpen()) {
            em.close();
        }
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}

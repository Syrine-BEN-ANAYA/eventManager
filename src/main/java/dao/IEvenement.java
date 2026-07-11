package dao;

import entities.Evenement;
import java.util.List;

public interface IEvenement {
    void addEvenement(Evenement e);
    void updateEvenement(Evenement e);
    void deleteEvenement(int id);
    Evenement getEvenement(int id);
    List<Evenement> getAllEvenements();

}
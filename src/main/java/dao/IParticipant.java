package dao;

import java.util.List;
import entities.Participant;

public interface IParticipant {
    void addParticipant(Participant p);

    void deleteParticipant(int id);

    Participant getParticipant(int id);

    List<Participant> getAllParticipants();
}

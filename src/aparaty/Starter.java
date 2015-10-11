package aparaty;

public class Starter {

	public static ClipsController clips;
	public static QuestionFrame questionFrame;

	public static void main(String[] args) {
		questionFrame = new QuestionFrame("Inicjalizacja...");
		clips = new ClipsController();		
	
		questionFrame.start();
	}

}

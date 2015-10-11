package aparaty;

import java.util.ArrayList;
import java.util.Random;
import javax.swing.JOptionPane;
import CLIPSJNI.*;

public class ClipsController {
	
	
	public Environment environment;

	private PrimitiveValue currentQuestion;
	private boolean lastQuestion;

	public ClipsController() {
		this.environment = new Environment();

		this.environment.clear();
		this.environment.load("data//templates.clp");
		this.environment.load("data//dane.clp");
		this.environment.load("data//pytania.clp");
		this.environment.load("data//test.clp");

		this.environment.reset();
	}

	/*
	 * Zwraca losowe pytanie
	 */
	public void getQuestion() throws Exception {
		Random random = new Random();
		ArrayList<PrimitiveValue> questionList = getQuestionList();

		int i = random.nextInt(questionList.size());
		this.currentQuestion = questionList.get(i);

		this.environment.assertString("(pyt "
				+ currentQuestion.getFactSlot("id") + ")");
		this.environment.run();
	}

	/*
	 * Zwraca listê PrimitiveValue ze wszystkimi znalezionymi pytaniami.
	 */
	private ArrayList<PrimitiveValue> getQuestionList() {
		ArrayList<PrimitiveValue> list = new ArrayList<PrimitiveValue>();

		MultifieldValue questionList = (MultifieldValue) environment
				.eval("(find-all-facts ((?f pytanie)) TRUE)");

		try {
			if (questionList.size() == 0) {
				this.showChoice();
				return null;
			}
		} catch (Exception e1) {
			JOptionPane.showMessageDialog(null,
					"B³¹d podczas wczytywania pytania!");
		}

		try {
			for (int i = 0; i < questionList.size(); i++) {
				list.add(questionList.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public void showChoice() {
		JOptionPane
				.showMessageDialog(
						null,
						"<html><body style='width: 310'>Najlepszym wyborem dla twoich potrzeb bêdzie: <br />"
								+ getChoice());

		System.exit(0);
	}

	private String getChoice() {
		String result = null;

		ArrayList<PrimitiveValue> cameraList = this.getCameraList();
		int i = new Random().nextInt(cameraList.size());
		PrimitiveValue pv = cameraList.get(i);

		try {
			String camera = pv.getFactSlot("parametry").toString();
			result = getCameraName(camera);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	private String getCameraName(String camera) {
		String parameters[] = camera.split(" ");
		String result = parameters[1] + " " + parameters[3];
		result = result.replace("\"", "");
		result = result.replace('_', ' ');

		return result;
	}

	private ArrayList<PrimitiveValue> getCameraList() {
		ArrayList<PrimitiveValue> list = new ArrayList<PrimitiveValue>();

		MultifieldValue cameraList = (MultifieldValue) environment
				.eval("(find-all-facts ((?f aparat)) TRUE)");

		try {
			for (int i = 0; i < cameraList.size(); i++) {
				list.add(cameraList.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public String getTresc() {
		try {
			return this.currentQuestion.getFactSlot("tresc").stringValue();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null,
					"B³¹d podczas wczytywania tresci pytania!");

			e.printStackTrace();
		}

		return null;
	}

	public String getCurrentQuestionId() {
		try {
			return this.currentQuestion.getFactSlot("id").toString();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null,
					"B³¹d podczas wczytywania id pytania!");
			e.printStackTrace();
		}

		return null;
	}

	public void answer(boolean ans) throws Exception {
		String answer = "(odp " + this.getCurrentQuestionId();

		if (ans == true) {
			answer += " 1 ";
		} else {
			answer += " 0 ";
		}

		answer += ")";

		this.environment.assertString(answer);
		this.environment.run();
	}

	public boolean isLastQuestion() {
		MultifieldValue cameraList = (MultifieldValue) environment
				.eval("(find-all-facts ((?f aparat)) TRUE)");

		try {
			if (cameraList.size() <= 1) {
				return true;
			}
		} catch (Exception e) {	}

		return false;
	}
}

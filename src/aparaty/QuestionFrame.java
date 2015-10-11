package aparaty;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

import CLIPSJNI.PrimitiveValue;

public class QuestionFrame extends javax.swing.JFrame implements ActionListener {

	public JLabel questionLabel;
	public boolean isLastQuestion;

	private JPanel panel;
	private JButton trueButton;
	private JButton falseButton;

	public QuestionFrame(String question) {
		super("System ekspercki - Wybór aparatu");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		this.panel = new JPanel();
		this.questionLabel = new JLabel(question);
		this.trueButton = new JButton("Tak");
		this.falseButton = new JButton("Nie");

		Dimension size = new Dimension(325, 180);

		this.panel.setLayout(null);

		trueButton.addActionListener(this);
		falseButton.addActionListener(this);

		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		this.setBounds((screenSize.width - size.width) / 2,
				(screenSize.height - size.height) / 2, size.width, size.height);
		this.add(panel);

		panel.add(questionLabel);
		panel.add(trueButton);
		panel.add(falseButton);

		this.questionLabel.setMaximumSize(new Dimension(320, 100));
		this.questionLabel.setBounds(10, 20, 300, 30);
		this.trueButton.setBounds(10, 100, 100, 25);
		this.falseButton.setBounds(200, 100, 100, 25);

		this.trueButton.setVisible(false);
		this.falseButton.setVisible(false);

		this.setResizable(false);

		this.isLastQuestion = false;
	}

	@Override
	public void actionPerformed(ActionEvent event) {
		try {
			if (event.getSource() == trueButton) {
				Starter.clips.answer(true);
			} else if (event.getSource() == falseButton) {
				Starter.clips.answer(false);
			}
		} catch (Exception ex) {

		}

		if (this.isLastQuestion == false) {
			this.nextQuestion();
		} else {
			this.determineCameraChoice();
		}
	}

	/*
	 * Punkt rozpoczêcia programu
	 */
	public void start() {
		JOptionPane
				.showMessageDialog(
						null,
						"<html>Witamy w systemie eksperckim, który pomaga <br /> wybraæ odpowiedni dla nas aparat fotograficzny.</html>");

		this.trueButton.setVisible(true);
		this.falseButton.setVisible(true);
		this.setVisible(true);

		this.nextQuestion();
	}

	public void nextQuestion() {
		try {
			Starter.clips.getQuestion();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (Starter.clips.isLastQuestion() == true) {
			this.determineCameraChoice();
		}
		
		this.questionLabel.setText("<html><body style='width: 310'>"
				+ Starter.clips.getTresc() + "</html>");
	}

	private void determineCameraChoice() {
		Starter.clips.showChoice();
	}
}

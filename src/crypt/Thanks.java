package crypt;

enum Words{
	word1("항상"), word2("좋은"), word3("강의를"), word4("들려주셔서"), word5("감사합니다!");
	private String word;
	Words(String word){
		this.word = word;
	}
	String getWords() {
		return this.word;
	}
}

public class Thanks {
	public static void main(String[] args) {
		for(Words w : Words.values()) {
			System.out.print(w.getWords() + " ");
		}
	}
}

List<String> findValidWords(List<String> dict, char letters[]){
        int []avail = new int[26];
        for(char c : letters){
            int index = c - 'a';
            avail[index]++;
        }
        List<String> result = new ArrayList();
        for(String word: dict){
            int []count = new int[26];
            boolean ok = true;
            for(char c : word.toCharArray()){
                int index = c - 'a';
                count[index]++;
                if(count[index] > avail[index]){
                    ok = false;
                    break;
                }
            }
            if(ok){
                result.add(word);
            }
        }
        return result;
    }
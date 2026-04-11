export function getProgramIdFromPrefs(compType, appliedOption) {
    switch (compType) {
        case 'BCS': return 1;
        case 'BCS with Honours': return 2;
        case 'BACS': switch(appliedOption) {
            case 'muc': return 3;
            case 'game-dev': return 4;
            case 'software-dev': return 5;
            case 'data-analytics': return 6;
            case 'interdisciplinary-studies': return 7;
            default: return -1;
        }
        default: return -1;
    }
}
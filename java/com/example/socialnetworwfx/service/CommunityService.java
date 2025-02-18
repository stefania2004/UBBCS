package com.example.socialnetworwfx.service;//import java.util.Comparator;
//import java.util.HashSet;
//import java.util.List;
//import java.util.Set;
//
//public class CommunityService {
//    private UserDbRepository userRepository;
//    private FriendshipDbRepository friendshipRepository;
//
//    public CommunityService(UserDbRepository userRepository, FriendshipDbRepository friendshipRepository) {
//        this.userRepository = userRepository;
//        this.friendshipRepository = friendshipRepository;
//    }
//
//    public List<Set<Long>> getCommunityGraph() {
//        Graph<Long, DefaultEdge> graph = new SimpleGraph<>(DefaultEdge.class);
//        userRepository.findAll().forEach(user -> {graph.addVertex(user.getID());});
//        friendshipRepository.findAll()
//                .forEach(friendship -> graph
//                        .addEdge(friendship.getFirstFriend().getID(),friendship.getSecondFriend().getID()));
//        return new ConnectivityInspector<>(graph).connectedSets();
//    }
//    public Set<Long> biggestCommunity() {
//        List<Set<Long>> communityGraph = getCommunityGraph();
//        return communityGraph.stream()
//                        .max(Comparator.comparingInt(Set::size))
//                        .orElse(new HashSet<>());
//    }
//
//}

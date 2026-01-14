#!/bin/bash

# SearchScreen
cat > src/screens/other/SearchScreen.js << 'EOF'
import React, { useState } from 'react';
import { View, Text, StyleSheet, TextInput, FlatList, TouchableOpacity, Image } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Ionicons } from '@expo/vector-icons';
import { dbHelpers } from '../../config/supabase';
import theme from '../../config/theme';

export default function SearchScreen({ navigation }) {
  const [searchQuery, setSearchQuery] = useState('');
  const [results, setResults] = useState([]);
  const [loading, setLoading] = useState(false);

  const handleSearch = async () => {
    if (!searchQuery.trim()) return;
    setLoading(true);
    try {
      const { data } = await dbHelpers.getProviders({ search: searchQuery });
      setResults(data || []);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.searchBar}>
        <Ionicons name="search" size={20} color={theme.colors.textSecondary} />
        <TextInput
          style={styles.searchInput}
          placeholder="Search providers..."
          value={searchQuery}
          onChangeText={setSearchQuery}
          onSubmitEditing={handleSearch}
        />
      </View>
      <FlatList
        data={results}
        renderItem={({ item }) => (
          <TouchableOpacity 
            style={styles.resultItem}
            onPress={() => navigation.navigate('ProviderDetail', { providerId: item.id })}
          >
            <Image source={{ uri: item.logo }} style={styles.resultImage} />
            <Text style={styles.resultName}>{item.name}</Text>
          </TouchableOpacity>
        )}
        keyExtractor={(item) => item.id}
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: theme.colors.background },
  searchBar: { flexDirection: 'row', alignItems: 'center', backgroundColor: theme.colors.surface, margin: theme.spacing.lg, padding: theme.spacing.md, borderRadius: theme.borderRadius.md },
  searchInput: { flex: 1, marginLeft: theme.spacing.sm, fontSize: theme.fontSizes.base },
  resultItem: { flexDirection: 'row', alignItems: 'center', padding: theme.spacing.md, borderBottomWidth: 1, borderBottomColor: theme.colors.border },
  resultImage: { width: 50, height: 50, borderRadius: theme.borderRadius.sm },
  resultName: { marginLeft: theme.spacing.md, fontSize: theme.fontSizes.base, color: theme.colors.text },
});
EOF

# TransactionsScreen
cat > src/screens/other/TransactionsScreen.js << 'EOF'
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import theme from '../../config/theme';

export default function TransactionsScreen() {
  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.title}>Transaction History</Text>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: theme.spacing.lg, backgroundColor: theme.colors.background },
  title: { fontSize: theme.fontSizes['2xl'], fontWeight: 'bold' },
});
EOF

# DisputesScreen
cat > src/screens/other/DisputesScreen.js << 'EOF'
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import theme from '../../config/theme';

export default function DisputesScreen() {
  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.title}>Disputes</Text>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: theme.spacing.lg, backgroundColor: theme.colors.background },
  title: { fontSize: theme.fontSizes['2xl'], fontWeight: 'bold' },
});
EOF

# SettingsScreen
cat > src/screens/other/SettingsScreen.js << 'EOF'
import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Ionicons } from '@expo/vector-icons';
import theme from '../../config/theme';

export default function SettingsScreen() {
  const settings = [
    { icon: 'notifications-outline', label: 'Notifications', value: 'On' },
    { icon: 'language-outline', label: 'Language', value: 'English' },
    { icon: 'shield-checkmark-outline', label: 'Privacy', value: '' },
    { icon: 'help-circle-outline', label: 'Help & Support', value: '' },
    { icon: 'information-circle-outline', label: 'About', value: 'v1.0.0' },
  ];

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView>
        <Text style={styles.title}>Settings</Text>
        {settings.map((setting, index) => (
          <TouchableOpacity key={index} style={styles.settingItem}>
            <Ionicons name={setting.icon} size={24} color={theme.colors.text} />
            <Text style={styles.settingLabel}>{setting.label}</Text>
            <Text style={styles.settingValue}>{setting.value}</Text>
            <Ionicons name="chevron-forward" size={20} color={theme.colors.textLight} />
          </TouchableOpacity>
        ))}
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: theme.colors.background },
  title: { fontSize: theme.fontSizes['2xl'], fontWeight: 'bold', padding: theme.spacing.lg },
  settingItem: { flexDirection: 'row', alignItems: 'center', backgroundColor: theme.colors.surface, padding: theme.spacing.md, marginHorizontal: theme.spacing.lg, marginBottom: theme.spacing.sm, borderRadius: theme.borderRadius.md },
  settingLabel: { flex: 1, marginLeft: theme.spacing.md, fontSize: theme.fontSizes.base, color: theme.colors.text },
  settingValue: { fontSize: theme.fontSizes.sm, color: theme.colors.textSecondary, marginRight: theme.spacing.sm },
});
EOF

echo "Other screens created!"

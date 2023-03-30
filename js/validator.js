// * {ok: false, message: `${name} is required`}
// * {ok: false, message: `type ${type} expected for ${name}`}
// * {ok: false, message: `unexpected property ${name}`}
// errorMessage = { ok: false, message: `type ${currentFieldType} expected for ${nameOfField}` };

//
function formatErrorMessage(reason, expectedField, expectedValue) {
  const messages = {
    type: `type ${expectedValue} expected for ${expectedField}`,
    missing: `${expectedField} is required`,
  };

  return { ok: false, message: messages[reason] };
}

function validateFieldType(schemaField, employeeField, fieldOverride) {
  const schemaFieldType = schemaField.type;
  console.log('employee field: ', employeeField);
  let employeeFieldType = typeof employeeField;

  if (employeeFieldType === 'object' && schemaField.type === 'array:employee') {
    console.log('\n\nIS TYPE OBJECT\n\n');
    if (Array.isArray(employeeField)) {
      console.log('\n\nIS TYPE ARRAY\n\n');
      employeeFieldType = 'array:employee';
    }
  }

  const typesMatch = schemaFieldType === employeeFieldType;
  console.log(`schemaFieldType: ${schemaFieldType}`);
  console.log(`employeeFieldType: ${employeeFieldType}`);

  console.log(`typesMatch: ${typesMatch}`);

  if (!typesMatch && fieldOverride) {
    return fieldOverride;
  }
  if (!typesMatch) {
    return schemaFieldType;
  }
}

function isValid(employee, schema) {
  for (let i = 0; i < schema.length; i += 1) {
    const currentField = schema[i];
    const nameOfField = currentField.name;
    console.log(`nameOfField: ${nameOfField}`);
    const requiredField = currentField.required === true;
    const employeeField = employee[nameOfField];
    if (employeeField) {
      const invalidField = validateFieldType(currentField, employeeField);
      console.log(`invalid field: ${invalidField}`);

      if (invalidField) {
        return formatErrorMessage('type', nameOfField, invalidField);
      }

      const subordinates = employeeField?.reports?.reports;
      if (subordinates) {
        const subordinateField = schema.subordinates;
        const subordinateNameOfField = subordinateField.name;
        console.log(`nameOfField: ${subordinateNameOfField}`);
        validateFieldType(currentField, subordinates, 'subordinates');
      }
    }

    if (requiredField && !employeeField) {
      return formatErrorMessage('missing', nameOfField);
    }
    console.log('\n\n');
  }
}

function validate(employees, schema) {
  // iteratate over each employee
  let errorMessage;
  for (let i = 0; i < employees.length; i += 1) {
    // check the schema against each employee
    errorMessage = isValid(employees[i], schema.employee);
    if (errorMessage) {
      return errorMessage;
    }
  }

  return { ok: true, message: 'success' };
}
// -----------------------------------------------------------------------------
// TEST CASES
// -----------------------------------------------------------------------------
const schema = {
  employee: [
    { name: 'name', required: true, type: 'string' },
    { name: 'title', required: true, type: 'string' },
    { name: 'salary', required: true, type: 'number' },
    { name: 'remote', required: false, type: 'boolean' },
    { name: 'reports', required: false, type: 'array:employee' },
    { name: 'subordinates', required: false, type: 'array:employee' },
    { name: 'id', required: true, type: 'string' },
  ],
};

// Formatted correctly
console.log('\n\n------------------');
console.log('Formatted correctly');
console.log('------------------');
const employees1 = [{
  name: 'alice',
  title: 'ceo',
  salary: 100,
  reports: [{
    name: 'bob',
    title: 'cfo',
    salary: 10,
    reports: [{
      name: 'zorp',
      title: 'controller',
      salary: 40,
    }],
  }],
}];
console.log('expected: ', { ok: true, message: 'success' });
console.log('actual: ', validate(employees1, schema));

// Missing a required field
console.log('\n\n------------------');
console.log('Missing a required field');
console.log('------------------');
const schema2 = {
  employee: [
    {
      name: 'name',
      required: true,
      type: 'string',
    },
    {
      name: 'id',
      required: true,
      type: 'number',
    },
  ],
};

const employees2 = [
  {
    name: 'alice',
  },
];

console.log('expected: ', { ok: false, message: 'id is required' });
console.log('actual: ', validate(employees2, schema2));

// A required field with the wrong type
console.log('\n\n------------------');
console.log('A required field with the wrong type');
console.log('------------------');
const employees3 = [{
  name: 2,
  title: 'ceo',
  salary: 100,
  reports: [{
    name: 2,
    title: 'cfo',
    salary: 10,
    reports: [{
      name: 'zorp',
      title: 'controller',
      salary: 40,
    }],
  }],
}];
console.log('expected: ', { ok: false, message: 'type string expected for name' });
console.log('actual: ', validate(employees3, schema));

console.log('\n\n------------------');
console.log('Optional field with wrong type');
console.log('------------------');
const employees4 = [
  {
    id: 1,
    name: 'alice',
    title: 1,
  },
];

const schema6 = {
  employee: [
    {
      name: 'id',
      required: true,
      type: 'number',
    },
    {
      name: 'name',
      required: true,
      type: 'string',
    },
    {
      name: 'title',
      required: false,
      type: 'string',
    },
  ],
};

console.log('expected: ', { ok: false, message: 'type string expected for title' });
console.log('actual: ', validate(employees4, schema6));

// Reports with the correct type
console.log('\n\n------------------');
console.log('Array field with correct type');
console.log('------------------');
const employees5 = [{
  name: 'alice',
  title: 'ceo',
  salary: 100,
  remote: true,
  id: '1',
  reports: [{
    name: 'zorp',
    title: 'controller',
    salary: 40,
  }],
}];

console.log('expected: ', { ok: true, message: 'success' });
console.log('actual: ', validate(employees5, schema));

// Reports with the ingcorrect type
console.log('\n\n------------------');
console.log('Array field with incorrect type');
console.log('------------------');
const employees6 = [{
  name: 'alice',
  title: 'ceo',
  salary: 100,
  remote: true,
  id: '1',
  reports: 'hi',
}];

console.log('expected: ', { ok: false, message: 'type array:employee expected for reports' });
console.log('actual: ', validate(employees6, schema));

// Validates subordinates
console.log('\n\n------------------');
console.log('Array field with incorrect type: subordinates');
console.log('------------------');
const employees7 = [{
  name: 'alice',
  title: 'ceo',
  salary: 100,
  remote: true,
  id: '1',
  reports: [{
    name: 'bob',
    title: 'cfo',
    salary: 10,
    reports: 'hi',
  }],
}];

console.log('expected: ', { ok: false, message: 'type array:employee expected for subordinates' });
console.log('actual: ', validate(employees7, schema));
